import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';

export const publicGuard: CanActivateFn = (route, state) => {
  const router: Router = inject(Router);
  if (localStorage.getItem('token')) {
    router.navigate(['/private/dashboard']);
    return false;
  }
  return true;
};
