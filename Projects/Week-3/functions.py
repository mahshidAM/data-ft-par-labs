

categories = {'aperitif':'aperitif-cat48640', 'bases':'bases-cat48653', 'drink':'boissons-cat48664' , 'dessert':'desserts-cat48681',
             'starter':'entrees-cat48785', 'main':'plats-cat48816' }
def get_path(name):
    """
    Convert name to URL
    Output url for category:name

    """
    h = 'https://www.cuisineaz.com/categories/'
    if name in categories.keys():
        return h + categories[name]
    return None
    

def Syntaxe(key):
    """
    Get HTML tags for each ket
    Output html tag

    """
    if key == 'title':
        return 'h1.recipe-title'
    if key == 'total_time':
        return'section.recipe_infos .icon-prepa'
    if key == 'prep_time':
        return 'ul.borderSection_toolbar  li#ContentPlaceHolder_trPrepa span'
    if key == 'cook_time':
        return 'ul.borderSection_toolbar  li#ContentPlaceHolder_trCuisson span'
    if key == 'difficulty':
        return 'section.recipe_infos .icon-toque'
    if key == 'comments':
        return 'section.recipe_infos div.recipe_note .smoothScroll b'
    if key == 'rating':
        return '.recipe_note .icon-star', '.recipe_note .icon-half-star'
    if key == 'category':
        return '.breadcrumbs li:nth-child(3) span'
    if key == 'yield':
        return '.ingredients header span'
    if key == 'image':
        return 'section.recipe_img img'
    return None


def get_minutes(text):

    """
    Convert time in str to minut
    Output time in min if is convertible, time

    """
    text = text.strip('min') 
    if 'h' in text:
        try:
            return int(text.split('h')[0])*60 + int(text.split('h')[1])
        except:
            return int(text.split('h')[0])*60
    try:
        return int(text)
    except:
        return text
    
def rename_difficulty(text):
    """
    Rename text if is in the list, text otherwise

    """
    if text == 'Facile':
        return 'easy'
    if text == 'Intermédiaire':
        return 'medium'
    if text == 'Difficile':
        return 'difficult'

    return text

def rename_category(text):
    """
    Rename text if is in the list, text otherwise

    """
    names= {'Apéritif':'aperitif', 'Bases':'bases', 'Boissons':'drink' , 'Desserts':'desserts',
              'Entrees':'starter', 'Plats':'main' }
    if text in names.keys():
        return names[text]
    return text
    
