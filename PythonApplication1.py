import mysql.connector
import random
import sys
import os
 

try:
    con = mysql.connector.connect(
       host = "localhost",
       user = "root",
        password = "root",
       database = "tiktok"
       )
    cur = con.cursor()

    print("OPERACJE NA TABELI TIKTOKI")
    print("1 - WYSWIETLANIE tabeli tiktoki")
    print("2 - WSTAWIANIE dotabeli tiktoki")
    print("3 - UPDATE nazy uzytkownika w tabeli uzytkownicy")
    print("4 - USUWANIE uzytkownika")
    i = input("WYBIERZ OPCJE:")    
    #wyswietlanie
    if i == '1':
        query = "select * from tiktoki"
        cur.execute(query)
        for(id, nazwa, polubien, czas_trwania, filtr_id, tworca_id) in cur:
           print("{}, {}, {}, {}, {}, {}".format(id, nazwa, polubien, czas_trwania, filtr_id, tworca_id))
        
    #insert
    if i == '2':
        print("DODAWANIE NOWEGO tiktoka: ")  
        nazwa = input("podaj nazwe tik toka ")
        polubien = input("podaj dowolna ilosc polubien ")
        czas_trwania = input("podaj czas trwania ")
        tworca_id = input("podaj id tworcy (1-4) ") 
        filtr_id = input("podaj id filtru (1-7) ")


        query = ("INSERT INTO tiktoki(nazwa, polubien, czas_trwania, filtr_id, tworca_id) VALUES('{}', '{}', '{}', {}, {})".format( nazwa, polubien, czas_trwania, filtr_id, tworca_id))
        #val = (name, surname, place)
        cur.execute(query)
        con.commit()
    #update
    if i == '3':
        print("ZMIEN NAZWY DANEGO UZYTKOWNIKA: ")
        #lasyid = cur.lastidrow()
        id = input("podaj poprawne id uzytkownika dla ktorego chcesz zmienić imie ")
        nowa_nazwa = input("podaj nowa nazwe uzytkownika")
        query = ("update uzytkownicy set nazwa ='{}' where id = '{}';".format(nowa_nazwa, id))
        cur.execute(query)
        con.commit()
    #delete   
    if i == '4':
        print("USUWANIE UZYTKOWNIKA: ")
        id = input("podaj id uzytkownika ktorego chcesz usunac ")
        query = ("delete from uzytkownicy where id = '{}';".format(id))

        cur.execute(query)
        con.commit()
        print("USUWANIETO URZYTKOWNIKA O ID: ", id)

    con.close()
except:
    print("cos poszlo nie tak, mozliwe ze podales zle dane")
