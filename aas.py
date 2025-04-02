import tkinter as tk
from tkinter import simpledialog

class TodoApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Todo List")
        self.tasks = []
        
        # Поле ввода
        self.entry = tk.Entry(root, width=40)
        self.entry.pack(pady=10)
        
        # Кнопка добавления
        self.add_btn = tk.Button(root, text="Добавить", command=self.add_task)
        self.add_btn.pack()
        
        # Фрейм для задач
        self.tasks_frame = tk.Frame(root)
        self.tasks_frame.pack(pady=10, fill=tk.BOTH, expand=True)

    def add_task(self):
        text = self.entry.get()
        if text:
            self.tasks.append(text)
            self.entry.delete(0, tk.END)
            self.update_tasks()

    def delete_task(self, index):
        del self.tasks[index]
        self.update_tasks()

    def edit_task(self, index):
        new_text = simpledialog.askstring("Редактирование", "Введите новый текст:", initialvalue=self.tasks[index])
        if new_text and new_text.strip():
            self.tasks[index] = new_text.strip()
            self.update_tasks()

    def update_tasks(self):
        # Очистка предыдущих задач
        for widget in self.tasks_frame.winfo_children():
            widget.destroy()
        
        # Отрисовка новых задач
        for i, task in enumerate(self.tasks):
            task_frame = tk.Frame(self.tasks_frame)
            task_frame.pack(fill=tk.X, padx=5, pady=2)
            
            tk.Label(task_frame, text=task, width=30, anchor='w').pack(side=tk.LEFT)
            tk.Button(task_frame, text="✎", command=lambda i=i: self.edit_task(i)).pack(side=tk.LEFT, padx=5)
            tk.Button(task_frame, text="✖", command=lambda i=i: self.delete_task(i)).pack(side=tk.LEFT)

if __name__ == "__main__":
    root = tk.Tk()
    app = TodoApp(root)
    root.mainloop()