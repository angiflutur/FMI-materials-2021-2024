import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Student } from '../../data/interfaces/student';
import { ApiService } from './api.service';

@Injectable({
  providedIn: 'root'
})
export class StudentService {
  private readonly route = 'student';

  constructor(private readonly apiService: ApiService) { }

  getAllStudents(): Observable<Array<Student>> {
    return this.apiService.get(this.route);
  }

  deleteStudent(studentId: string): Observable<any> {
    return this.apiService.delete(`${this.route}/${studentId}`);
  }
}
