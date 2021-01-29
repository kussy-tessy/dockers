package main

import (
	"fmt"
	"time"
)

type Task struct {
	job func()
	id int
}

func(task *Task) DoJob() int{
	task.job()
	return task.id
}

func worker(id int, jobs <-chan *Task, results chan<- bool){
	for job := range jobs {
		fmt.Println("id", id , "のworkerが処理するよ！")
		jobNum := job.DoJob()
		fmt.Println("id",id, "のworkerが処理したのは", jobNum, "番のジョブだった！")
		results <- true
	}
}

func main(){
	start := time.Now()

	jobs := make(chan *Task, 100)
	results := make(chan bool, 100)

	for id := 0; id < 3; id++{
		go worker(id, jobs, results)
	}

	for job_id := 0; job_id < 10; job_id++ {
		job := func(){
			time.Sleep(time.Second * 1)
		}
		task := &Task{job: job, id: job_id}
		jobs <- task
	}
	close(jobs)

	// 10回結果を受け取ったらこのforループから抜けられる
	for job_id := 0; job_id < 10; job_id++ {
		<- results
	}

	end := time.Now()

	fmt.Printf("%f秒\n",(end.Sub(start)).Seconds())
}