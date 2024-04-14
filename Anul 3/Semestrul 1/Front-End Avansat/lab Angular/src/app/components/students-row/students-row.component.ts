import { Component, EventEmitter, Input, Output } from '@angular/core';
import { Student } from 'src/app/interfaces/student';

@Component({
  selector: 'app-students-row',
  templateUrl: './students-row.component.html',
  styleUrls: ['./students-row.component.scss']
})
export class StudentsRowComponent {
  @Input() studentData!: Student ;
  @Output() doExmatriculare: EventEmitter<Student>
    = new EventEmitter<Student>();

  noDate: any = new Date();

  exmatriculeazaStudent(stud: Student | null) {
    this.doExmatriculare.emit(stud!)
  }
}
