import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { environment } from '../../../environments/environment';
import { Student } from '../../data/interfaces/student';

@Component({
  selector: 'app-demo1',
  templateUrl: './demo1.component.html',
  styleUrls: ['./demo1.component.scss']
})
export class Demo1Component implements OnInit {
  public title: string = "Demo 1 component with requests inside";

  public studentFromApi1: Student = { id: 0, name: '', age: 0 };
  public studentFromApi2: Student = { id: 0, name: '', age: 0 };
  public studentFromApi3: Student = { id: 0, name: '', age: 0 };
  public studentFromApi4: Student = { id: 0, name: '', age: 0 };

  public students: Student[] = [];

  private readonly apiUrl = environment.apiUrl;

  constructor(private readonly httpClient: HttpClient, private readonly router: Router) { }

  ngOnInit(): void {
    let userId = 7;


    // GET
    // in route
    this.httpClient.get<Student>(`${this.apiUrl}students/byId/${userId}`).subscribe((data) => {
      console.log('Student 1 from api ', data);
      this.studentFromApi1 = data;
    });

    // with qrParams
    let params = { id: 2 };
    this.httpClient.get<Student>(`${this.apiUrl}students/fromQuery`, {params}).subscribe((data) => {
      console.log('Student 2 from api ', data);
      this.studentFromApi2 = data;
    });

    // with headers
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'id': '6'
    });
    this.httpClient.get<Student>(`${this.apiUrl}students/fromHeader`, { headers }).subscribe((data) => {
      console.log('Student 3 from api ', data);
      this.studentFromApi3 = data;
    });

    // POST

    // with form data
    const formData = new FormData();
    formData.append('name', 'Bob');
    formData.append('id', '9');
    formData.append('age', '20');

    this.httpClient.post(`${this.apiUrl}students/fromForm`, formData).subscribe((data: any) => {
      console.log('Post reponse from api with from form ', data);
      this.students = data;
    });

    // with form body
    let newStudent = {
      Name: 'Florin',
      Age: 30,
      Id: 10
    };

    this.httpClient.post(`${this.apiUrl}students/fromBody`, newStudent).subscribe((data: any) => {
      console.log('Post reponse from api with from body', data);
      this.students = data;
    });

    // PATCH
    let patchObject = [
      {
        'op': 'replace',
        'path': 'name',
        'value': 'Maria 1'
      }];
    let userId2 = 1;
    this.httpClient.patch(`${this.apiUrl}students/patch/${userId2}`, patchObject).subscribe((data: any) => {
      console.log('Patch reponse from api', data);
      this.students = data;
    });
  }

  navigateTo(student: Student) {
    this.router.navigate(['/demo2', student.id]);
  }
}
