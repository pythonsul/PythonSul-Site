#!/usr/bin/env python3
# -*- coding: utf-8 -*- #
import os

# path = os.path.realpath(os.path.dirname(os.path.join(os.getcwd(), "../")))
# sys.path.append(path)
# print(path)

# from .. import pelicanconf

# print(pelicanconf.SITENAME)
SITENAME = 'Blog Python Sul - 2024'

PATH = os.getcwd() + '/blog/content'

PAGE_URL = 'pages/{slug}.html'
PAGE_SAVE_AS = 'pages/{slug}.html'
ARTICLE_URL = 'pages/{slug}.html'
ARTICLE_SAVE_AS = 'pages/{slug}.html'

STATIC_SAVE_AS = 'blog/'
THEME_STATIC_DIR = 'blog/'