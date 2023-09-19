import { Component, OnInit } from '@angular/core';
import { CourseService } from '../../../core/services/course.service';
import { Course } from '../../../data/interfaces/course';

@Component({
  selector: 'app-courses',
  templateUrl: './courses.component.html',
  styleUrls: ['./courses.component.css']
})
export class CoursesComponent implements OnInit {
  public courses: Array<Course> = [];

  constructor(private readonly courseService: CourseService) { }

  ngOnInit(): void {
    this.courseService.getAllCourses().subscribe((data: Array<Course>) => this.courses = data);
  }

  deleteCourse(courseId: string) {
    this.courseService.deleteCourse(courseId).subscribe((data: any) => this.courses = data);
  }

}
