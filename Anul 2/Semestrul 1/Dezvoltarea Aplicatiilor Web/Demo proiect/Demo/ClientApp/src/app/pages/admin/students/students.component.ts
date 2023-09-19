import { Component, OnInit } from '@angular/core';
import { StudentService } from '../../../core/services/student.service';
import { Student } from '../../../data/interfaces/student';

@Component({
  selector: 'app-students',
  templateUrl: './students.component.html',
  styleUrls: ['./students.component.css']
})
export class StudentsComponent implements OnInit {
  public students: Array<Student> = [];

  constructor(private readonly studentService: StudentService) { }

  ngOnInit(): void {
    this.studentService.getAllStudents().subscribe((data: Array<Student>) => this.students = data);
  }

  deleteStudent(studentId: string) {
    this.studentService.deleteStudent(studentId).subscribe((data: any) => this.students = data);
  }

}
