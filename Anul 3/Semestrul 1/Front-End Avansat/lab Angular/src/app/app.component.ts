import { Component } from '@angular/core';
import { Student } from './interfaces/student';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'fmi2023';
  showAlert: boolean | null | number = true;

  fructe: string[] = ['mar', 'para', 'banana'];
  studenti: Student[] = [
    {
      nume: 'Ionel',
      nota: 5,
      matematica: 12
    },
    {
      nume: 'Gigel',
      nota: 7
    },
    {
      nume: 'Ana',
      nota: 9
    }
  ];

  doHideOrShowAlert() {
    this.showAlert = !this.showAlert;
  }

  adaugaFruct(fruct: string) {
    this.fructe.push(fruct);
  }

  exmatriculeaza(student: Student) {
    console.log('EXMATRICULEAZA', student);
  }
}
