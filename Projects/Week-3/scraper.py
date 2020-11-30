from functions import *
import requests as r
from bs4 import BeautifulSoup
from adaptive import adaptive_scrapping
import re


class Scraper:
 
    def __init__(self):
        self.soup = None

    def load(self, url):
        try:
            resp = adaptive_scrapping(url)
            self.soup = BeautifulSoup(resp)
            self.url = url
        except:
            return None
        
    def href(self):
        return self.url
        
    def title(self):
        try:
            return self.soup.select(Syntaxe('title'))[0].text.strip()
        except:
            return None
    def time(self, name):  
        try:
            return self.soup.select(Syntaxe(name))[0].text.strip()
        except:
            return None
    def difficulty(self):
        try:
            return self.soup.select(Syntaxe('difficulty'))[0].text.strip()
        except:
            return None
    def comments(self):
        try:
            return self.soup.select(Syntaxe('comments'))[0].text.strip()
        except:
            return None
    def rating(self):
        try:
            return len(self.soup.select(Syntaxe('rating')[0])) + len(self.soup.select(Syntaxe('rating')[1]))*0.5
        except:
            return None
    def category(self):
        try:
            return self.soup.select(Syntaxe('category'))[0].text.strip()
        except:
            return None
    def yields(self):
        try:
            return self.soup.select(Syntaxe('yield'))[0].text.strip()
        except:
            return None
    def image(self):
        try:
            return self.soup.select(Syntaxe('image'))[0].get('data-src')
        except:
            return None
    def ingredients(self):
        try:
            return ' '.join([' '.join(i.text.strip().split(':')[::-1]).strip()+', ' if re.match(".*\\d+.*", i.text)
                                    else i.text.strip() for i in self.soup.select(Syntaxe('ingredients'))])
        except:
            return None
        
        

def collectPath(category):
    """
    Collect all path for combination of categories
    Output list of URLs

    """
    article_hrefs=[]

    for cat in (categories):

        if cat in category or category == 'all':
            print('Collect URLs',get_path(cat))
            resp = adaptive_scrapping(get_path(cat))
            soup = BeautifulSoup(resp)
            hrefs = soup.select('article.recipe  div.tile_content a')
            article_hrefs+=['https://www.cuisineaz.com'+ i.get('href') for i in hrefs]
            page = 2
            total_page = len(soup.select('ul.pagination li')) if ',' not in category else 3

            while page < total_page and len(article_hrefs) < 200:
                resp = r.get(f'{get_path(cat)}?page={page}#listRecettes')
                soup = BeautifulSoup(resp.content)
                hrefs = soup.select('article.recipe  div.tile_content a')
                article_hrefs+=['https://www.cuisineaz.com'+ i.get('href') for i in hrefs]
                page+=1
            
    return article_hrefs