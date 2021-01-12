#!/usr/bin/python
#encoding: utf-8

# pip install nltk

import sys
import os
import re
import pickle
import nltk
from datetime import datetime
from nltk.corpus import stopwords
from nltk.stem import SnowballStemmer

entrada=open('etiquetador-spa.pkl','rb')
etiquetador=pickle.load(entrada)
entrada.close()


nameFile = "verbs2"
dir = "./data/"
if len(sys.argv) == 3:
    dir = sys.argv[1]
    nameFile = sys.argv[2]
    if dir[-1] != '/':
        dir = dir + '/'
else:
    print("Execution: python3 analisys2.py dirDataToTransform nameExitFile")
    print("Example: python3 analisys2.py ./data/mystery/ ./data-test/allVerbsMystery")
    exit(1)


instanteInicial = datetime.now()
print("--Loading data--")
#os.chdir("./data/")
listFich = os.listdir(dir)
listFd = []
for name in listFich:
    if name[0] == '.':
        continue
    fd = open(dir + name)
    listFd.append(fd)
    print("File analysed:" + name)
#os.chdir("..")

txtAll = ""
for fd in listFd:
    for linea in fd:
        txtAll = txtAll + linea
    fd.close()


print("--Start transformations--" + (datetime.now() - instanteInicial).seconds.__str__())

txtAll = re.sub('[!#?¿,.:";]', ' ', txtAll)    # removePunctuation
txtAll = re.sub('[0-9]', '', txtAll)  # removeNumbers
txtAll = re.sub('[ ][ ]', ' ', txtAll) #2 spaces
txtAll = re.sub('[ ][ ][ ]', ' ', txtAll) #3 spaces
txtAll = txtAll.replace("/", " ")\
    .replace("@", " ") \
    .replace("\\|", "")\
    .replace("»", " ")\
    .replace("«", " ")\
    .replace("—", " ")\
    .replace("––", " ")\
    .replace("\\“", " ")\
    .replace("\\”", " ")\
    .replace("\\’", " ")
txtAll = txtAll.lower()

#print(txt)

print("--Remove stopwords-- " + (datetime.now() - instanteInicial).seconds.__str__())
tokens = [t for t in txtAll.split()]
clean_tokens = tokens[:]

sr = stopwords.words('Spanish')
for token in tokens:
    if token in stopwords.words('Spanish'):
        clean_tokens.remove(token)


txtAll = ' '.join([str(elem) for elem in clean_tokens])
#print(txtAll)



print("--Star Tagging-- " + (datetime.now() - instanteInicial).seconds.__str__())

tokenitzador=nltk.tokenize.RegexpTokenizer('\w+|[^\w\s]+')
textTok=tokenitzador.tokenize(txtAll)
tagged_text=etiquetador.tag(textTok)
#print(tagged_text)
listVerbs = []
for word in tagged_text:
    if word[1].__contains__("VM"):
        listVerbs.append(word[0])
txtVerbs = ' '.join([str(elem) for elem in listVerbs])
#print("List: " + txtVerbs)


print("--Reduce to Lexema-- " + (datetime.now() - instanteInicial).seconds.__str__())
spanish_stemmer = SnowballStemmer('spanish')
for linea in txtVerbs.split("\n"):
   # print(linea)
    linea2 = ""
    for a in linea.split():
        a = spanish_stemmer.stem(a)
       # print(a)
        linea2 = linea2 + " " + a
    txtVerbs = txtVerbs + " " + linea2


print("--Save in a txt-- " + (datetime.now() - instanteInicial).seconds.__str__())
if not nameFile.__contains__(".txt"):
    nameFile = nameFile + ".txt"
file = open(nameFile, "w+")
file.write(txtVerbs)
file.close()


print("--Finish All-- " + (datetime.now() - instanteInicial).seconds.__str__())
