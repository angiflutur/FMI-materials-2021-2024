import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';

export const privateGuard: CanActivateFn = (route, state) => {
  const router: Router = inject(Router);
  if (!localStorage.getItem('token')) {
    router.navigate(['/public/login']);
    return false;
  }
  return true;
};
