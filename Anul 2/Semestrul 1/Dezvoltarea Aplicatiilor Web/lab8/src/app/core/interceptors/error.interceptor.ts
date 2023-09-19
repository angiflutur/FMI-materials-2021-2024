import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
  HttpErrorResponse
} from '@angular/common/http';
import { Observable, tap } from 'rxjs';

@Injectable()
export class ErrorInterceptor implements HttpInterceptor {

  constructor() {}

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    return next.handle(request).pipe(tap(() => {
      console.log('Request was succesfull');
    },
      (error) => {
        if (error instanceof HttpErrorResponse) {
          if (error.status === 401) {
            // go to login
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
