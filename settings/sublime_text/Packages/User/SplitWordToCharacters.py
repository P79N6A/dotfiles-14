import math
import re
import getopt
import sublime
import sublime_plugin

class SplitWordToCharactersCommand(sublime_plugin.TextCommand):
   def run(self, edit, contents, quoted_double, quoted_single):
    for region in self.view.sel():
      if not region.empty():
        quoted = ''

        if quoted_double:
          quoted = '"'

        if quoted_single:
          quoted = "'"

        newText = ''
        selectedText = self.view.substr(region)
        selectedLength = int(selectedText.count(''))

        for x in range(0, (int(selectedLength) - 1)):
          separator = ''
          selectedChar = str(selectedText[x])
          if selectedChar == ' ':
            selectedChar = str('space')
          if newText != '':
            separator = ' '
          newText += str(separator) + str(quoted) + str(selectedChar) + str(quoted)

        if newText != '':
          collect = newText.split(' ')
          newText = re.sub(r'\s{1,}', ', ', newText)

        # Replace selectedText with newText
        selectedText = str(newText)

        # Delete current and quotes
        # self.view.run_command('select_a_quotes')
        # self.view.run_command('delete_in_quotes')
        # self.view.run_command('delete_quotes')

        self.view.replace(edit, region, '' + selectedText + '')
