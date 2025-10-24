package com.ksa.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ksa.model.Student;

@Controller
public class StudentController {

	private List<Student> students = new ArrayList<>();

	@GetMapping("/")
	public String getAddPage(Model model) {
		model.addAttribute("student", new Student());
		return "add.jsp";
	}

	@PostMapping("/add")
	public String addStudent(Student student, Model model) {
		students.add(student);
		model.addAttribute("student", new Student());
		model.addAttribute("msg", "Student added");
		System.out.println("****************New Student Record added**************");
		return "add.jsp";
	}

	@GetMapping("/students")
	public String displayStudentList(Model model) {
		model.addAttribute("studentList", students);
		System.out.println("************fetched all the students to display*************");
		return "list.jsp";
	}

	@GetMapping("/deleteStudent")
	public String deleteStudent(@RequestParam Integer id) {
		Student s = null;
		for (Student student : students) {
			if (student.getId() == id) {
				s = student;
			}
		}
		if (s != null) {
			students.remove(s);
			System.out.println("************Student Deleted with id " + id + "**************");
		}
		return "redirect:/";
	}

}
