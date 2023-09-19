import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

// Components
import { Component1Component } from './component1/component1.component';
import { Component2Component } from './component2/component2.component';

const componentsArray = [Component1Component, Component2Component];

@NgModule({
  declarations: componentsArray,
  exports: componentsArray,
  imports: [
    CommonModule
  ]
})
export class ComponentsModule { }
