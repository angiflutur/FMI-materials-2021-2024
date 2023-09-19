import { Directive, ElementRef, HostListener } from '@angular/core';

@Directive({
  selector: '[appMouseEvents]'
})
export class MouseEventsDirective {

  constructor(private htmlElement: ElementRef) { }

  @HostListener('mouseleave') OnMouseLeave() {
    this.htmlElement.nativeElement.style.background = 'blue';
  }

  @HostListener('mouseenter') OnMouseEnter() {
    this.htmlElement.nativeElement.style.background = 'red';
  }
}
