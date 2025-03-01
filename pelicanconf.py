#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals
from decouple import config
import os, sys

SITENAME = 'Python Sul - 2025'
SITEYEAR = 2025

SITEURL = config('SITE_URL', default='')

PATH = os.path.join(os.getcwd(), 'content')

SITEMAP = {
    'format': 'xml',
    'exclude': ['tags.html', 'categories.html', 'authors.html', 'archives.html']
}

ARTICLE_ORDER_BY = 'date'
TIMEZONE = 'America/Sao_Paulo'

DEFAULT_LANG = 'pt-br'

# OLD_EVENTS
OLD_EVENTS = (
    ('2024','/2024'),
    ('2023','/2023'),
)

MENU = (
    ('#intro','Início', True),
    ('#pre-about','Sobre', False),
    ('#pre-keynotes','Keynotes', False),
    ('#pre-lineup','Cronograma', False),
    ('#pre-location', 'Local', False),
    ('#pre-sponsorship','Patrocínio', False),
    ('#pre-code-conduct','Código de Conduta', False),
    ('blog','Blog', False),
)

# Social widget
SOCIAL = (
    ('instagram','https://www.instagram.com/pythonsul'),
    ('twitter', 'https://twitter.com/PythonSul'),
    ('telegram', 'https://t.me/PythonSulBR'),
    ('linkedin', 'https://www.linkedin.com/in/python-sul/'),
)

DEFAULT_PAGINATION = False
SITE_META_KEYWORDS = f"Python Sul {SITEYEAR}, evento python, python, pythonsul, comunidade python, python rio grande do sul, comunidade"
SITE_META_DESCRIPTION = "Evento da comunidade Python do sul do pais, com intuito de popularizar e disseminar o conhecimento da linguagem python"

# Uncomment following line if you want document-relative URLs when developing
# RELATIVE_URLS = True

