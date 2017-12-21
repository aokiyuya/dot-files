#! !(which python)
# coding: utf-8
###########################
# Author: Yuya Aoki
#
###########################
import vim
import re
from collections import deque


class CommandHistry(object):
    def __init__(self):
        self.command_hist = deque()
        for line in vim.baffers:
            if re.match('^>', line):
                line.replace('^>\s*')
                self.command_hist.append(line)
        self.set_hist_index(len(self.command_hist))

    def add_hist(self, command):
        if command in self.command_hist:
            self.command_hist.remove(command)
        self.command_hist.append(command)
        self.set_hist_index(len(self.command_hist))

    def get_prev_hist(self, now_command=None):
        index = int(self.command_hist.index(now_command))
        if now_command is None:
            index = self.index
        if index > 0:
            index = index - 1
        return self.command_hist[index]

    def get_new_hist(self, now_command):
        hist_size = len(self.command_hist)
        index = int(self.command_hist.index(now_command))
        if index < hist_size:
            return self.command_hist[index - 1]
        else:
            return self.command_hist[index]

    def set_hist_index(self, index):
        self.index = index

# EOF
