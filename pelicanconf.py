#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals
from decouple import config
import os, sys

AUTHOR = 'dadsa Sul'

SITENAME = 'Python Sul - 2024'
SITEYEAR = 2024

SITEURL = config('SITE_URL', default='')

PATH = os.path.join(os.getcwd(), 'site/content')

SITEMAP = {
    'format': 'xml',
    'exclude': ['tags.html', 'categories.html', 'authors.html', 'archives.html']
}

ARTICLE_ORDER_BY = 'date'
TIMEZONE = 'America/Sao_Paulo'

DEFAULT_LANG = 'pt-br'

# OLD_EVENTS
OLD_EVENTS = (
    ('2023','/2023'),
)

MENU = (
    ('#intro','Início', True),
    ('#pre-about','Sobre', False),
    ('#pre-contact','Contato', False),
    ('/blog','Blog', False),
)

# Social widget
SOCIAL = (
    ('instagram','https://www.instagram.com/pythonsul'),
    ('twitter', 'https://twitter.com/PythonSul'),
    ('telegram', 'https://t.me/PythonSulBR'),
)

DEFAULT_PAGINATION = False
SITE_META_KEYWORDS = f"Python Sul {SITEYEAR}, evento python, python, pythonsul, comunidade python, python rio grande do sul, comunidade"
SITE_META_DESCRIPTION = "Evento da comunidade Python do sul do pais, com intuito de popularizar e disseminar o conhecimento da linguagem python"

# Uncomment following line if you want document-relative URLs when developing
# RELATIVE_URLS = True

EVENTO = {
    "data": "2024",
    "data_completa": "2024",
    "local": "Florianopolis",
    "call_for_papers_link": '',
    "inscricao_link": '',
}

CATEGORIES_SAVE_AS = ''
ARCHIVES_SAVE_AS = ''
TAGS_SAVE_AS = ''
AUTHORS_SAVE_AS = ''

if 'IS_BLOG' in os.environ:
    parent_path = os.path.dirname(os.path.abspath('blog'))
    sys.path.append(parent_path)
    from blog.blog_pelicanconf import *