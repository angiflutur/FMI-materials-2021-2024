import { Injectable } from '@angular/core';
import { BehaviorSubject, map } from 'rxjs';
import { ApiService } from '../api/api.service';

@Injectable({
  providedIn: 'root'
})
export class StudentService {
  private readonly route = 'students';
  private responseSource = new BehaviorSubject<object>({});
  public response = this.responseSource.asObservable();

  constructor(private readonly apiService: ApiService) { }

  getStudentWithQueryParams(id = {}) {
    return this.apiService.get(this.route + '/fromQuery/', { id });
  }

  getStudentWithQueryParamsFiltered(id = {}) {
    return this.apiService.get(this.route + '/fromQuery/', { id }).pipe(map(x => {
      console.log('data from api inside service', x);
      this.responseSource.next(x);
      return x;
    }));
  }
}
