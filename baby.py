from random import choice

questions = ["Why is the sky blue?: ", "Why do cars make noise?: ",
             "Who am I?: "]


question = choice(questions)
answer = input(question).strip().lower()

correct_answer = "just because"

if answer == correct_answer:
    print("Okay")

while answer != correct_answer:
    answer = input("But why?: ").strip().lower()

    if answer == correct_answer:
        print("Oh... Okay")
