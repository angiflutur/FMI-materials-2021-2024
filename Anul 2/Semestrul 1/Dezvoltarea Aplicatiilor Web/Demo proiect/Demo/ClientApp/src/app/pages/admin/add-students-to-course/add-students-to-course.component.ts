import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CourseService } from '../../../core/services/course.service';
import { StudentService } from '../../../core/services/student.service';
import { Student } from '../../../data/interfaces/student';

@Component({
  selector: 'app-add-students-to-course',
  templateUrl: './add-students-to-course.component.html',
  styleUrls: ['./add-students-to-course.component.css']
})
export class AddStudentsToCourseComponent implements OnInit {
  public courseId = '';
  public studentsList: Array<Student> = [];
  public selectedStudents: Array<Student> = [];
  constructor(private readonly route: ActivatedRoute, private readonly courseService: CourseService, private readonly studentService: StudentService) { }

  ngOnInit(): void {
    this.courseId = this.route.snapshot.params.courseId;
    this.studentService.getAllStudents().subscribe((students: Array<Student>) => this.studentsList = students);
  }

  updateCourse() {
   this.courseService.addStudentsToCourse(this.courseId, this.selectedStudents.map(x => x.id)).subscribe(data=>console.log(data));
  }

}
