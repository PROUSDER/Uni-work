#include <stdio.h>

class student {
private:
  std::string name; int marks1; int marks2;
public:
  void disp() {
    printf("%s scored %d.\n", name, (marks1 + marks2));
  }
  /*char calc_media() {
  }
    */
    void setNameNMarks(char nameToBe, int marks1ToBe, int marks2ToBe) {
      name = nameToBe; marks1 = marks1ToBe; marks2 = marks2ToBe;
    }
};

int main() {
  char studentName; int firstMark; int secondMark;

  printf("enter the student name and their marks.\n");
  scanf("%s", &studentName);
  scanf("%d", &firstMark);
  scanf("%d", &secondMark);

  student stu1;
  stu1.setNameNMarks(studentName, firstMark, secondMark);
  stu1.disp();

  return 0;
}
