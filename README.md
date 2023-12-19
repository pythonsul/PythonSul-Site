Python Sul
============

[sul.python.org.br](https://sul.python.org.br)

Repositorio do site Python sul 

Evento da comunidade Sul do pais, com intuito de popularizar e disseminar o conhecimento da linguagem python.

Projeto [Pelican](https://docs.getpelican.com/en/latest/)!

# Ambiente
```shell
git clone git@github.com:pythonsul/PythonSul-Site.git;
cd PythonSul-Site
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
cp .env.sample .env
```

# Rodar
```shell
source .venv/bin/activate
invoke reserve
```

# Configuração

> 
> python decouple para configurar a url.
>

# Deploy
```shell
[dentro da env]$ invoke gh-pages
```
