
import matplotlib.pyplot as plt

def main():
    original_sig = [ ]

    with open('data/BiosignalsSample.txt', 'r') as file:
        for row in file:
            row = row.split()
            original_sig.append(int(row[0]))

    plt.figure(1)
    plt.plot(original_sig)
    plt.title("Original Signal")
    plt.show()

if __name__ == '__main__':
    main()
