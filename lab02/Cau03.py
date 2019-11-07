import sys
import string

#Quy uoc hang se bo trong " ", dau cach thay bang -
class Term:
    def __init__(self, name="", n = 0, para = []):
        self.name , self.n, self.para = name, n, para
    def print(self):
        print("%s" % (self.name), end=" ")
        for el in self.para:
            print(el, end=" ")
        print()

class Rule:
    def __init__(self, name = "", n = 0, para=[]):
        self.name, self.n, self.para, self.lists = name, n, para, [] 
    def print(self):
        print("%s" % (self.name), end=" ")
        for el in self.para:
            print(el, end=" ")
        print()
        for el in self.lists:
            print("|L|",end=" ")
            el.print()
#Ham kiem tra xem gia tri la hang (hang duoc bo trong " ") hay bien
def checkVar(key):
    if (key[0] != '\"'):
        return True
    return False

#Ham kiem tra Q voi fact
def checkFact(fact, Q):
    checked = False
    if fact.name == Q.name and fact.n == Q.n: #Kiem tra ten cua Q va so doi so
        if (Q.n == 1): #Chi co 1 Atom hay Var
            if not checkVar(Q.para[0]): #Q.para[0] la atom (hang)
                if (Q.para[0] == fact.para[0]):
                    print("true")
                    return True
                else: #khong khop voi atom cua fact
                    checked = False
            else:
                checked = True
                print(Q.para[0] + " = " + fact.para[0])
        else: #Co 2 Atom hay Var
            if not checkVar(Q.para[0]): #Q.para[0] la atom (hang)
                if (Q.para[0] == fact.para[0]): #Chi can xet xem Q.para[0] co bangfact.para[0]
                    if not checkVar(Q.para[1]): #Q.para[1] la atom (hang)
                        if (Q.para[1] == fact.para[1]):
                            print("true")
                            return True
                        else: 
                            checked = False
                    else: #Q.para[1] khong la atom (hang)
                        checked = True
                        print(Q.para[1] + " = " + fact.para[1])
            else:   #Q.para[0] la var
                if not checkVar(Q.para[1]): #Q.para[1] la atom (hang)
                    if (Q.para[1] == fact.para[1]):
                        checked = True
                        print(Q.para[0] + " = " + fact.para[0])
                else: #Q.para[1] la var 
                    checked = True
                    print(Q.para[0] + " = " + fact.para[0])
                    print(Q.para[1] + " = " + fact.para[1])
    return checked

#Ham kiem tra Q voi rule ****
def checkRule(KB, rule, Q):
    checked = False
    checkNot = False

    listAtom = []

    for el in rule.lists: #Cac thanh phan trong than rules
        if el.name == "not": #Thanh phan co toan tu not
            checkNot = True

        else:
            for fact in KB[0]:
                if (fact.name == el.name) and (fact.n == el.n):
                    if (rule.para[0] == el.para[0]):
                        listAtom.append([fact.name, None])
                    else:
                        listAtom.append([None, fact.name])
    return checked

def backwardChaining(KB, Q):
    #check Q in Facts
    #Bien ket qua
    checked = False
    for fact in KB[0]: #KB[0] la list fact
        checked = checkFact(fact, Q) or checked
    if (not checked):
        for rule in KB[1]:
            if (rule.name == Q.name) and (rule.n == Q.n):
                checked = checkRule(KB, rule, Q) or checked
                break
    if (not checked):
        print("false")

if __name__ == "__main__":
    #Doc tu file input 
    f = open(sys.argv[1])
    reader = f.readlines()
    f.close()

    #Xay dung KnowledgeBase va Quests
    #Danh sach Facts, Rules, Quest
    Facts = list()
    Rules = list()
    Quests = list()
    KB = list()
    
    for line in reader:
        line.replace('\n','')
        elem = line.split()
        if (elem != [] and elem[0][0] != '%'):
            #Append facts
            if (elem[0] == "f"):
                fact = Term(elem[1], elem.__len__() - 2,elem[2:])
                Facts.append(fact)
            elif (elem[0] == "r"):  
                count = elem.index(":") - 2
                rule = Rule(elem[1], count, elem[2:count + 2])
                # Lay cac vi tu trong danh sach suy ra
                arr = list(elem[count + 3:])
                #print(temp)
                new = True #danh dau khi gap "," (va)
                para = [] 
                while (arr != []):
                    temp = arr.pop(0)
                    if temp != ",":
                        if new:
                            name, para, new= temp, [], False
                        else:
                            para.append(temp)
                    else:
                        new = True
                    if (new or arr.__len__() == 0):
                        fact = Term(name,para.__len__(),para)
                        rule.lists.append(fact)
                Rules.append(rule)
            elif (elem[0] == "?"):
                quest = Term(elem[1], elem.__len__() - 2,elem[2:])
                Quests.append(quest)
    
    
    KB.append(Facts) #Them Facts vao KnowledgeBase
    KB.append(Rules) #Then Rules vao KnowledgeBase

    index = 0
    for quest in Quests:
        print(index, end=". ")
        quest.print()
        backwardChaining(KB, quest)
        print()
        index += 1