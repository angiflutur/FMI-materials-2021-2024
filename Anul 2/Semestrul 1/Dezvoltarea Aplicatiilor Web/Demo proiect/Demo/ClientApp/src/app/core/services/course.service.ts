import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Course } from '../../data/interfaces/course';
import { ApiService } from './api.service';

@Injectable({
  providedIn: 'root'
})
export class CourseService {
  private readonly route = 'course';

  constructor(private readonly apiService: ApiService) { }

  getAllCourses(): Observable<Array<Course>> {
    return this.apiService.get(this.route);
  }

  addNewCourse(newCourse: any): Observable<any> {
    return this.apiService.post(this.route, newCourse);
  }

  addStudentsToCourse(courseId: string, studentsIds: Array<string>): Observable<any> {
    return this.apiService.post(`${this.route}/${courseId}`, studentsIds);
  }

  deleteCourse(courseId: string): Observable<any> {
    return this.apiService.delete(`${this.route}/${courseId}`);
  }
}
