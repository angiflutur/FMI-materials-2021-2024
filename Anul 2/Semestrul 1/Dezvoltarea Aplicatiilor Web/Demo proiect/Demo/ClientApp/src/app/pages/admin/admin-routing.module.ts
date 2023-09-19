import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { AdminDashboardComponent } from './admin-dashboard/admin-dashboard.component';
import { CoursesComponent } from './courses/courses.component';
import { StudentsComponent } from './students/students.component';
import { StudentComponent } from './student/student.component';
import { CourseComponent } from './course/course.component';
import { AddCourseComponent } from './add-course/add-course.component';
import { AddStudentComponent } from './add-student/add-student.component';
import { AddStudentsToCourseComponent } from './add-students-to-course/add-students-to-course.component';

const routes: Routes = [
  {
    path: "dashboard",
    component: AdminDashboardComponent,
    children: [
      {
        path: "courses",
        component: CoursesComponent
      },
      {
        path: "students",
        component: StudentsComponent
      },
      {
        path: "add-course",
        component: AddCourseComponent
      },
      {
        path: "add-student",
        component: AddStudentComponent
      },
      {
        path: "add-students-in-course/:courseId",
        component: AddStudentsToCourseComponent
      }
    ]
  },
  {
    path: "student/:id",
    component: StudentComponent
  },
  {
    path: "course/:id",
    component: CourseComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }
