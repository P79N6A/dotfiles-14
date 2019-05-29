import math
import re
import getopt
import sublime
import sublime_plugin

class SplitWordToCharactersCommand(sublime_plugin.TextCommand):
   def run(self, edit):
    for region in self.view.sel():
      if not region.empty():
        newText = ''
        selectedText = self.view.substr(region)
        for x in range(0, math.sum([selectedText.count(''), 1])):
          separator = ''
          if newText != '':
            separator = ' '
          newText += str(separator) + str(selectedText[x])
        # collect = str.join(collect)
        # collect = re.split(r'\B([a-zA-Z0-9\-\_\+\=\.\,\;\'\"\[\]\{\}])\B', ''+ str(selectedText) +'', flags=re.LOCALE))
        # collect = re.split(r'(\S)', selectedText)
        # collect = re.split(r'(\S)', str(selectedText), flags=re.IGNORECASE)
        selectedText = str(newText)
        # re.split(r'\W+', 'Words, words, words.',)
        # re.split('[a-f]+', '0a3B9', flags=re.IGNORECASE)
        # age = 18
        # string = "Hello, I am " + str(age) + " years old"
        # for x in collect:
          # newText += ' ' + x
        # self.view.insert(edit, 0,  s)
        self.view.replace(edit, region, '' + selectedText + '')
