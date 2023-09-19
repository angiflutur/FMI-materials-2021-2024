using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DAL.Migrations
{
    /// <inheritdoc />
    public partial class changedRelations2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Courses_CoursesGrades_GradeId",
                table: "Courses");

            migrationBuilder.DropIndex(
                name: "IX_Courses_GradeId",
                table: "Courses");

            migrationBuilder.DropColumn(
                name: "GradeId",
                table: "Courses");

            migrationBuilder.AddColumn<Guid>(
                name: "StudentCourseGradeId",
                table: "StudentsInCourse",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.AlterColumn<string>(
                name: "Description",
                table: "CoursesGrades",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.CreateIndex(
                name: "IX_StudentsInCourse_StudentCourseGradeId",
                table: "StudentsInCourse",
                column: "StudentCourseGradeId",
                unique: true);

            migrationBuilder.AddForeignKey(
                name: "FK_StudentsInCourse_CoursesGrades_StudentCourseGradeId",
                table: "StudentsInCourse",
                column: "StudentCourseGradeId",
                principalTable: "CoursesGrades",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_StudentsInCourse_CoursesGrades_StudentCourseGradeId",
                table: "StudentsInCourse");

            migrationBuilder.DropIndex(
                name: "IX_StudentsInCourse_StudentCourseGradeId",
                table: "StudentsInCourse");

            migrationBuilder.DropColumn(
                name: "StudentCourseGradeId",
                table: "StudentsInCourse");

            migrationBuilder.AlterColumn<string>(
                name: "Description",
                table: "CoursesGrades",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AddColumn<Guid>(
                name: "GradeId",
                table: "Courses",
                type: "uniqueidentifier",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Courses_GradeId",
                table: "Courses",
                column: "GradeId",
                unique: true,
                filter: "[GradeId] IS NOT NULL");

            migrationBuilder.AddForeignKey(
                name: "FK_Courses_CoursesGrades_GradeId",
                table: "Courses",
                column: "GradeId",
                principalTable: "CoursesGrades",
                principalColumn: "Id");
        }
    }
}
