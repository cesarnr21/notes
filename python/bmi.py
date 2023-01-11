# This python script will calculate the Body Mass Index of an individual

mass = input('Enter your mass in pounds = ')
print('enter your height (feet and inches seperatly)')
feet = input('feet = ')
inches = input('inches = ')

mass = int(mass)
feet = int(feet)
inches = int(inches)

height = (feet*0.3048) + (inches*0.0254)
weight = (mass*0.454)

#need to try (height**2)
bmi = weight/(height*height)

if bmi < 18:
    print("Your BMI is %3.2f, therefore you are underweight" %bmi)
elif bmi >= 18 and bmi < 25:
    print("Your BMI is %3.2f, therefore you have a healthy weigh" %bmi)
elif bmi >= 25 and bmi < 30:
    print("Your BMI is %3.2f, therefore you are a little overweight" %bmi)
elif bmi >= 30:
    print("\nYour BMI is %3.2f, therefore you are obese, hit the gym" %bmi)
else:
    print("there is something wrong with this program")
