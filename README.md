# Hi there 🧃


![bd565dcc0a556add0b0a0ed6b26d686e](https://github.com/Netall0/Netall0/assets/113532176/3b1d4b44-6a21-4538-a6ec-2ba2a7c53f63)



<!--START_SECTION:waka-->
![Code Time](http://img.shields.io/badge/Code%20Time-340%20hrs%2042%20mins-blue)

📊 **This Week I Spent My Time On** 

```text
🕑︎ Time Zone: Asia/Novosibirsk

🔥 Editors: 
VS Code                  8 hrs 9 mins        █████████████████████████   100.00 % 

💻 Operating System: 
Windows                  8 hrs 9 mins        █████████████████████████   100.00 % 
```


 Last Updated on 19/10/2024 18:38:59 UTC
<!--END_SECTION:waka-->
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


 
                    
