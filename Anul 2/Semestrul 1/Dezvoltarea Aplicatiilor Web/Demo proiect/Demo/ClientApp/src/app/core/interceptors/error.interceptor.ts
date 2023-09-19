import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
  HttpErrorResponse
} from '@angular/common/http';
import { Observable, tap } from 'rxjs';
import { Router } from '@angular/router';

@Injectable()
export class ErrorInterceptor implements HttpInterceptor {

  constructor(private router: Router) {}

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    return next.handle(request).pipe(tap(() => {
      console.log('Request was succesfull');
    },
      (error) => {
        if (error instanceof HttpErrorResponse) {
          if (error.status === 401) {
            console.error(error);
            this.router.navigate(['login']);
            // and/or toast error
          }
          if (error.status === 500) {
            console.error('Server error');
          }
        }
      }
    ));
  }
}
