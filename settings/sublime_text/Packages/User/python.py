# import re
# result = re.sub(pattern, repl, string, count=0, flags=0);
# result = re.sub('abc',  '',    input)           # Delete pattern abc
# result = re.sub('abc',  'def', input)           # Replace pattern abc -> def
# result = re.sub(r'\s+', ' ',   input)           # Eliminate duplicate whitespaces
# result = re.sub('abc(def)ghi', r'\1', input)    # Replace a string with a part of itself

# collect = str.join(collect)
# collect = re.split(r'\B([a-zA-Z0-9\-\_\+\=\.\,\;\'\"\[\]\{\}])\B', ''+ str(selectedText) +'', flags=re.LOCALE))
# collect = re.split(r'(\S)', selectedText)
# collect = re.split(r'(\S)', str(selectedText), flags=re.IGNORECASE)
# re.split(r'\W+', 'Words, words, words.',)
# re.split('[a-f]+', '0a3B9', flags=re.IGNORECASE)
# age = 18
# string = "Hello, I am " + str(age) + " years old"
# for x in collect:
# newText += ' ' + x
# self.view.insert(edit, 0,  s)


# Rot13
# The plugin below will do a simple rot13 encoding on the selected text.
# After saving it to a file in Packages/User, you can run it via entering view.runCommand('rot13') in the console (accessible via Ctrl+~).

import sublime, sublimeplugin

class Rot13Command(sublimeplugin.TextCommand):
    def run(self, view, args):
        for region in view.sel():
            if not region.empty():
                # Get the selected text
                s = view.substr(region)
                # Transform it via rot13
                s = s.encode('rot13')
                # Replace the selection with transformed text
                view.replace(region, s)




# Duplicate
# This defines a simple command, "duplicate" that duplicates the current line. To run, add this line to Default.sublime-keymap:
# <binding key="ctrl+alt+d" command="duplicate"/>
# (or type view.runCommand('duplicate') in the console.)

import sublime, sublimeplugin

# Extends TextCommand so that run() receives a View to modify.
class DuplicateCommand(sublimeplugin.TextCommand):
    def run(self, view, args):
        # Walk through each region in the selection
        for region in view.sel():
            # Only interested in empty regions, otherwise they may span multiple
            # lines, which doesn't make sense for this command.
            if region.empty():
                # Expand the region to the full line it resides on, excluding the newline
                line = view.line(region)
                # Extract the string for the line, and add a newline
                lineContents = view.substr(line) + '\n'
                # Add the text at the beginning of the line
                view.insert(line.begin(), lineContents)
