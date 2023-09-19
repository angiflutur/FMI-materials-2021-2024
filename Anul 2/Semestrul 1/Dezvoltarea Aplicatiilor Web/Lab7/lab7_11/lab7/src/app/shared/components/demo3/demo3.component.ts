import { Component, OnInit } from '@angular/core';
import { StudentService } from '../../../core/services/student/student.service';
import { Student } from '../../../data/interfaces/student';

@Component({
  selector: 'app-demo3',
  templateUrl: './demo3.component.html',
  styleUrls: ['./demo3.component.scss']
})
export class Demo3Component implements OnInit {
  public studentFromApi: Student = { name: '', age: 0, id: 0 };

  constructor(private readonly studentService: StudentService) { }

  ngOnInit(): void {
    let userId = 4;
    this.studentService.getStudentWithQueryParams(userId).subscribe(data => {
      console.log('getStudentWithQueryParams', data);
      this.studentFromApi = data;
    });

    this.studentService.getStudentWithQueryParamsFiltered(userId).subscribe(data => {
      this.studentFromApi = data;
    });

    this.studentService.response.subscribe((data: any) => {
      console.log('response from BehaviorSubject', data);
      this.studentFromApi = data;
    });
  }

}
