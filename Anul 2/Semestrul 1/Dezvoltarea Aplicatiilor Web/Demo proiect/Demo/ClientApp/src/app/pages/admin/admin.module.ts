import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

// Components
import { CourseComponent } from './course/course.component';
import { AdminDashboardComponent } from './admin-dashboard/admin-dashboard.component';
import { CoursesComponent } from './courses/courses.component';
import { StudentsComponent } from './students/students.component';
import { StudentComponent } from './student/student.component';
import { AddStudentsToCourseComponent } from './add-students-to-course/add-students-to-course.component';
import { AddCourseComponent } from './add-course/add-course.component';
import { AddStudentComponent } from './add-student/add-student.component';

// Modules
import { MatListModule } from '@angular/material/list';
import { AdminRoutingModule } from './admin-routing.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatButtonModule, MatCardModule, MatFormFieldModule, MatIconModule, MatInputModule } from '@angular/material';


@NgModule({
  declarations: [AdminDashboardComponent, CoursesComponent, StudentsComponent, StudentComponent, CourseComponent, AddCourseComponent, AddStudentComponent, AddStudentsToCourseComponent],
  imports: [
    CommonModule,
    MatListModule,
    AdminRoutingModule,
    ReactiveFormsModule,
    MatCardModule,
    MatFormFieldModule,
    MatIconModule,
    MatButtonModule,
    FormsModule,
    MatInputModule
  ]
})
export class AdminModule { }
