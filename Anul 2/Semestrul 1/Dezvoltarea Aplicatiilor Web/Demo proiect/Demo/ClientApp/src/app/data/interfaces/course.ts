import { Student } from "./student";

export interface Course {
  id: string;
  title: string;
  description: string;
  maximumStudentsAllowed: number;
  teacherName?: string;
  grade?: number;
  students: Array<Student>;
}
