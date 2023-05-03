from pathlib import Path
import matplotlib.pyplot as plt


def main():
    data_path = Path(__file__).parent.parent / 'data'
    original_sig = [ ]

    with open(data_path / 'bio_signal_sample.txt', 'r') as file:
        for row in file:
            row = row.split()
            original_sig.append(int(row[0]))

    plt.figure(1)
    plt.plot(original_sig)
    plt.title("Original Signal")
    plt.show()

if __name__ == '__main__':
    main()
