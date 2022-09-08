//problem
//Print a pattern of numbers from  to  as shown below. Each of the numbers is separated by a single space.
//   4 4 4 4 4 4 4
//   4 3 3 3 3 3 4
//   4 3 2 2 2 3 4
//   4 3 2 1 2 3 4
//   4 3 2 2 2 3 4
//   4 3 3 3 3 3 4
//   4 4 4 4 4 4 4
//constraints: n>=1 && n <=1000

void main(List<String> arguments) {
  printPattern(9);
}

void printPattern(int n) {
  if (n > 0 && n <= 1000) {
    //this is the first row, It contains n in n+(n-1) places. I will continue with this same array
    var arr = List.filled(n + (n - 1), n, growable: true);

    //My solution is divided into two. One loop for the first n rows then the second is for the last n-1 rows.
    //This is because the pattern is like an anagram , it begins to repaet at the nth row.

    //----FIRST HALF-----//
    for (int i = 0; i < n; i++) {
      //we include the conditon so that the first row can be excluded.
      if (i > 0) {
        //exclude i elements from each end of the array
        //that leaves i to (n+(n-2))-i
        //create an array of the size of the range above ie
        List<int> fillerList = List.filled(((n + (n - 1)) - (i + i)), n - i);

        //then print the same array but replace the above specified range
        arr.replaceRange(i, (n + (n - 1)) - i, fillerList);

        print(arr.toString());
      } else {
        //for the first row
        print(arr);
      }
    }

    //------SECOND HALF------//

    //toString is used so I can utilize the replaceAll method. I also need a new array to manipulate afresh
    var newArr = arr;

    //only n-1 rows are needed

    //all the rows will contain 1,2,3 ,4 up till n. begin with the first row,
    //increment 1 by 1, next row, increment all occurences of 2 by 1 etc
    //print the rows as you go till you get to n.
    for (int i = 1; i < n; i++) {
      //loop throught the array to find the instance of 1,2,3,4...n
      for (int j = 0; j < newArr.length; j++) {
        if (newArr[j] == i) {
          newArr[j] = i + 1;
        }
      }

      print(newArr);
    }
  } else {
    print('Enter a number greater than 0 and less than or equal to 1000');
  }
}
