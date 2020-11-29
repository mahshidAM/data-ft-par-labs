from functions import *
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
        
        

