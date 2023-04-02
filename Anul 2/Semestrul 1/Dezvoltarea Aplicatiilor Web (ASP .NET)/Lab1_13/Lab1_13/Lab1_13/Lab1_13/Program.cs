// See https://aka.ms/new-console-template for more information
//Console.WriteLine("Hello, World!");

//var a = new object[] { 1, 2, 3 };
//var b = new object[] { "a", "b", "c" };

//for (var i = 0; i < a.Length; i++)
//{
//   Console.WriteLine(a[i]);
//}

//foreach (string s in b)
//{
//    // Console.WriteLine(s);
//}

//dynamic student = new { LastName = "Student Lastname 1", Grupa = "13" };
////Console.WriteLine(student.LastName);
//try
//{
//    // student.FirstName = "FirstName 1";
//}
//catch (Exception e)
//{
//    // Console.WriteLine(e.ToString());
//}


//const int number = 9;
//// number = 10;

//// Console.ReadLine();

//List<int> numbers = new List<int>();
//numbers.Add(number);
//numbers.Add(10);
//numbers.Add(20);

////Console.WriteLine(numbers.Where(x => x > 10).FirstOrDefault());
////Console.WriteLine(numbers.FirstOrDefault(x => x < 10));

//int sum(int a, int b, int c = 10)
//{
//    return a + b + c;
//}


//Console.WriteLine(sum(1, 2));
////Console.WriteLine(sum(1, 2, 3));

//// ref 
//void sumWithRef(int a, int b, ref int c)
//{
//    c = a + b;
//}

//int num = 2;
//sumWithRef(4, 5, ref num);
////Console.WriteLine(num);


//// out
//void sumWithOut(int a, int b, out int c)
//{
//    c = a + b;
//}

//int c;
//sumWithOut(4, 4, out c);
////Console.WriteLine(c);

using Lab1_13;
using Newtonsoft.Json;
///
var class1Obj = new Class1();
class1Obj.FirstName = "First Name 1";
class1Obj.LastName = "Last Name 1";

//Console.WriteLine(class1Obj.CompleteName);
//Console.WriteLine(class1Obj.ToString());
string objectSerialized = JsonConvert.SerializeObject(class1Obj);

Console.WriteLine(objectSerialized);

class1Obj.Method1();
