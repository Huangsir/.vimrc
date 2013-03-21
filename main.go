package main

import (
    "fmt"
    "strconv"
)

type collection struct {
    c interface{}
}

func (c *collection) add(key string) {
    switch t := c.c.(type) {
    case nil:
        c.c = new(childrenArr)
    case *childrenArr:
        if t.size() >= 10 {
            m := new(childrenMap)
            m.c = make(map[string]string)
            for _, item := range t.list() {
                m.add(item)
            }
            c.c = m
        }
        break
    }
    c.c.(children).add(key)
}

func (c *collection) del(key string) {
    switch t := c.c.(type) {
    case nil:
        c.c = new(childrenArr)
    case *childrenMap:
        if t.size() <= 11 {
            a := new(childrenArr)
            for _, item := range t.list() {
                a.add(item)
            }
            c.c = a
        }
        break
    }
    c.c.(children).del(key)
}

func (c *collection) Add(key string) {
    switch t := c.c.(type) {
    case nil:
        //c.c = new(carr)
        c.c = make(marr)
        break
    case *carr:
        t.add(key)
        break
    case marr:
        t.add(key)
        fmt.Printf("%v", t)
        break;
    }

    //fmt.Printf("%T\n", c.c)
    //autoadd(c.c, key)
    //fmt.Printf("%v", c.c)
}

func addarr(arr *[]string, key string) {
    fmt.Printf("%s\n", arr)
    *arr = append(*arr, key)
}

func autoadd(target interface{}, key string) {
    switch target.(type) {
    case map[string]string:
        target.(map[string]string)[key[0:1]] = key
        break
    case *[]string:
        *target.(*[]string) = append(*target.(*[]string), key)
    }
    str, _ := target.(*[]string)
    *str = append(*str, key)
    fmt.Printf("%T, %s\n", *str, key)
}

type carr []string
func (c *carr) add(key string) {
    *c = append(*c, key)
}

type marr map[string]string
func (c marr) add(key string) {
    c[key[0:1]] = key
}

//
// Children
//
type children interface {
    add(key string)
    del(key string) 
    get(key string) (string, int)
    size() int
}

//
// Slice
//
type childrenArr struct {
    children
    c []string
}

func (c *childrenArr) add(key string) {
    c.c = append(c.c, key)
}

func (c *childrenArr) get(key string) (string, int) {
    for idx, item := range c.c {
        if item == key {
            return item, idx
        }
    }
    return "", -1
}

func (c *childrenArr) del(key string) {
    _, idx := c.get(key)
    if idx != -1 {
        c.c = append(c.c[:idx], c.c[idx+1:]...)
    }
}

func (c *childrenArr) list() []string {
    return c.c
}

func (c *childrenArr) size() int {
    return len(c.c)
}

//
// Map
//
type childrenMap struct {
    children
    c map[string]string
}

func (c *childrenMap) add(key string) {
    c.c[key[0:1]] = key
}

func (c *childrenMap) get(key string) (string, int) {
    if item, ok := c.c[key[0:1]]; ok {
        return item, 1
    }
    return "", -1

}

func (c *childrenMap) del(key string) {
    delete(c.c, key[0:1])
}

func (c *childrenMap) list() []string {
    list := make([]string, 0)
    for _, item := range c.c {
        list = append(list, item)
    }
    return list
}

func (c *childrenMap) size() int {
    return len(c.c)
}


func main() {
    c := new(collection)
    for i := 0; i < 10000; i++ {
        for j := 0; j < 100; j++ {
            c.Add(strconv.Itoa(j))
        }
        //for j := 0; j < 100; j++ {
            //c.del(strconv.Itoa(j))
        //}
    }
    return
    fmt.Printf("%s\n", c)
}
