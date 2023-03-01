import cProfile
cProfile.run("200")

class parrot:
    def fly(self):
        print("parrot can fly")

    def swim(self):
        print("parrot can't swim")

class penguin:
    def fly(self):
        print("penguin can't fly")

    def fly(self):
        print("penguin can swim")

def flying_test(bird):
    bird.fly()

blue = parrot()
peggy = penguin()

flying_test(blue)
flying_test(peggy)



