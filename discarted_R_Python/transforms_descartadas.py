# pip install nltk
# pip install stanfordnlp
import nltk
from nltk.corpus import wordnet
import urllib.request
from nltk import pos_tag
from nltk.corpus import cess_esp
import string
import stanfordnlp

#nltk.download('averaged_perceptron_tagger')
#nltk.download()
#stanfordnlp.download('es')
#nltk.download('stopwords')

# Para reducir al lexema de la palabra
'''
spanish_stemmer = SnowballStemmer('spanish')

for linea in txt.split("\n"):
   # print(linea)
    linea2 = ""
    for a in linea.split():
        a = spanish_stemmer.stem(a)
       # print(a)
        linea2 = linea2 + " " + a
    txt = txt + " " + linea2

#print(txt)
'''


# Para mostrar la frecuencia de cada palabra
'''
freq = nltk.FreqDist(clean_tokens)
freq.plot(20,cumulative=False)

for key,val in freq.items():
    print(str(key) + ':' + str(val))
'''



'''
nlp = stanfordnlp.Pipeline(lang='es')
##nlp = stanfordnlp.Pipeline(lang='es', processors='tokenize,pos,lemma')

doc = nlp(txt)
print(doc.sentences[0].print_dependencies())
'''



# Obtencion ineficiente de verbos
'''
textTok = nltk.word_tokenize("Ruben Rodriguez Alvarez me llamo llamar hacer cocinar sdcds")
print(textTok)
tagged_sents=cess_esp.tagged_sents()
unigram_tagger=nltk.UnigramTagger(tagged_sents)
tagged_text=unigram_tagger.tag(textTok)

#tagged_text= nltk.pos_tag(textTok)
print(tagged_text)
listVerbs = []
for word in tagged_text:
    if word[1] in ["VB", "VBD", "VBG", "VBN", "VBP", "VBZ"]:
        listVerbs.append(word[0])
txtVerbs = ' '.join([str(elem) for elem in listVerbs])
print("List: " + txtVerbs)

'''


'''
textTok = nltk.word_tokenize(txtAll)
print(textTok)
tagged_text= nltk.pos_tag(textTok)
#for word in tagged_text:
#    if word
tagged_text
print(tagged_text[1:20])
'''
