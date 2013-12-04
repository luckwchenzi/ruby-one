$KCODE="u"
require "jcode"
#版本 ruby 1.8.6 (2007-09-24 patchlevel 111) [i386-mswin32]
###############################################################
#代码1
class Robot
	#说话
	def say(words)
		puts words
	end

	#说你好
	def say_hello
		say '你好!'
	end

end

my_robot=Robot.new 			#new实例化
my_robot.say_hello			#调用say_hello

###############################################################
#代码2
str="I am a string"
puts "str size:#{str.size} length:#{str.length}"
puts "str class:#{str.class} 100 class:#{100.class}"

=begin
文档注释
2013/12/2 23:46
=end


###############################################################
#代码3
a=0
if a<10
	puts "a小于10"
elsif a<20
	puts "a大于等于10，但小于20"
elsif a<30
	puts "a大于等于20，但小于30"
else
	puts "a小于30"
end

puts "a小于10 if a<10" if a<10

#unless 相当于！，否
unless a<10 then
	puts "a 不小于10"
else
	puts "a<10"
end


###############################################################
#代码4 （相当于switch）
case a.class.name
when "String"
	puts "a 为字符串"
when "Fixnum","Bignum","Float"
	puts "a 为数字"
when "Array"
	pust "a数组"
else
	puts "a为#{a.class.name}"
end


###############################################################
#代码5
a=0
while a==0 #do 可以省略
	puts 'a==0'
	a=a+1
end  

i=0
print "until i>10 :"
until i>10 #until 循环
	print i
	i+=1
end
puts "\n"

print "for i in [1,2,3,4,5] :"
for i in [1,2,3,4,5] #for in Array
	print i
end
puts "\n"

print "for i in (1..10) #for in(1..10) :"
for i in (1..10) #for in(1..10)
	print i
end
puts "\n"


print "[1,2,3,4,5,6,7,8,9,10].each :"
[1,2,3,4,5,6,7,8,9,10].each do |i| print i end
puts "\n"


for i in (1..10)
	next if i<5 	#next is like continue
	break if i==9   #break
	print i
end
puts "\n"

###############################################################
#代码6
class MyClass
end

puts MyClass.class
puts MyClass.class.superclass
puts MyClass.class.superclass.superclass
puts MyClass.class.superclass.superclass.superclass


###############################################################
#代码7
class MyClass
	def self.method1	#类方法
		puts "method 1"
	end
	def MyClass.method2 #类方法
		puts "method 2"
	end
	def method3 		#实例方法，对象的方法
		puts "method 3"
	end
end

MyClass.method1				#相当于java的静态方法
MyClass.method2
MyClass.new.method3


###############################################################
#代码8
class MyClass
	#使用attr_accessor定义attr1属性
	attr_accessor:attr1

	#使用方法定义attr2属性
	def attr2
		@attr2
	end

	def attr2=(value)
		@attr2=value
	end

end


my_class=MyClass.new
my_class.attr1="attr1"
puts my_class.attr1

my_class.attr2="attr2"
puts my_class.attr2



###############################################################
#代码9
class MyClass
	#默认是public
	def public_method
		puts "public_method"
	end

	protected
	def protected_method
		puts "protected_method"
	end

	private
	def private_method
		puts "private_method"
	end

	public
	def public_method1
		puts "public_method1"
	end
end


class MySubClass < MyClass
	#子类可以在内部使用父类中Protected和private的方法
	def call_protected_method
		protected_method
	end

	def call_private_method
		private_method
	end
end

my_sub_class=MySubClass.new
my_sub_class.call_private_method
my_sub_class.call_protected_method

###############################################################
#代码10

class MyClass
	def initialize(name)
		@name=name
	end

	def compare(c)
		c.name==@name
	end

	#private	#`compare': private method `name' called for #<MyClass:0x331e770 @name="b"> (NoMethodError)
	protected 	#换成private,在compare中c.name即会报错
	def name
		@name
	end
end

a=MyClass.new('a')
b=MyClass.new('b')
a.compare(b)


###############################################################
#代码11

class MyClass
	@@instant_object_count=0

	#返回MyClass的实例数量
	def self.instant_object_count
		@@instant_object_count
	end

	#返回实例对象的序号
	def object_index
		@instant_object_index
	end

	#实例方法返回MyClass的所有实例数量
	def object_count
		@@instant_object_count
	end

	#初始化函数
	def initialize
		#创建新实例对象时，类变量计数器加1，并且标记序号给实例变量
		@@instant_object_count=@@instant_object_count+1
		@instant_object_index=@@instant_object_count
	end

end

my_class1=MyClass.new
puts "现在有#{MyClass.instant_object_count}个MyClass实例"
my_class2=MyClass.new
puts "现在有#{my_class1.object_count}个MyClass实例"
puts "my_class1的序号#{my_class1.object_index},共有#{my_class1.object_count}个实例对象"
puts "my_class2的序号#{my_class2.object_index},共有#{my_class2.object_count}个实例对象"



###############################################################
#代码12
class Fixnum
	#添加一个实例方法
	def speak
		puts "我的值是#{self}"
	end

	#覆盖旧的abs方法
	def abs
		puts "abs不能用"
	end

end

#扩展类方法
def Fixnum.say_hello
	puts "hello!"
end

#批量扩展类方法
class << Fixnum

	def say_hello_again
		puts "hello agin!"
	end
end


1.speak
-1.abs
Fixnum.say_hello
Fixnum.say_hello_again


###############################################################
#代码13
class Person

	attr_accessor:name,:age

	def say_hello
		puts "你好,我是#{self.name}"
	end

	def say_age
		puts "我的年龄#{self.age}"
	end

end

class Man<Person
	def sex
		return @sex
	end

	def sex=k
		@sex=k
	end

	def say_sex
		puts "我的性别是#{self.sex}"
	end

	def say_hello
		super #掉用Person类中的say_hello方法
		say_age
		say_sex
	end

end

man=Man.new
man.name="张三"
man.sex="男人"
man.age=20
man.say_hello



###############################################################
#代码13

class Fixnum

	#创建一个加法的别
	alias plus+

	def +(value)
		return self.plus(value*2)
	end

end

puts 1.plus(1) 	#结果为2
puts 1+1 		#结果为3

#防止影响后面的代码
class Fixnum
	#恢复+方法
	def +(value)
		self.plus(value)
	end
end

###############################################################
#代码14
class MyClass
	attr_accessor:value

end

a=MyClass.new
a.value=1
b=a
a.value=2
puts a.value
puts b.value

puts 'new copy'
#测试对象复制

a=MyClass.new
a.value=1
def a.new_method
	puts "变量a的新方法"
end

b=a.dup
c=a.clone
a.value=2
puts a.value
puts b.value
puts c.value
a.new_method
#b.new_method	#undefined method `new_method' for #<MyClass:0x340a9b8 @value=1, @instant_object_index=6> (NoMethodError)
c.new_method 	#dup不能复制扩展的方法，clone可以复制扩展的方法


###############################################################
#代码15
class MyClass
	attr_accessor:value
end

a=MyClass.new
a.value=1

#获得a的序列化字符
dump_value=Marshal.dump(a)

#通过序列化字符重建对象
b=Marshal.load(dump_value)

puts b.class 	#输出 MyClass
puts b.value 	#输出1
puts "dump_value:#{dump_value}"


#深度复制方法
def deep_copy(obj)
	Marshal.load(Marshal.dump(obj))
end



###############################################################
#代码16
module MyModule
	def self.module_function
		puts "这是模块方法"
	end

end

module MyModule
	CONST="这是模块中的常量"
	module MySubModule
		CONST="这是子模块中的常量"
	end
end



puts MyModule.class 		#输出Module
MyModule.module_function 	#输出这是模块方法
MyModule::module_function 	#输出这是模块方法


puts MyModule::CONST					#这是模块中的常量
puts MyModule::MySubModule::CONST 		#这是子模块中的常量



###############################################################
#代码17

module MyModule
	def module_method
		puts "module_method"
	end
end

class MyClass
	include MyModule
end


class MyClass1
	extend MyModule
end

my_class=MyClass.new
#类中使用include,模块中的方法变成了实例方法
my_class.module_method


#类中使用extend,模块中的方法成了类方法
MyClass1.module_method



aa="123"
#所有对象都可以extend模块而获得模块中的方法
aa.extend(MyModule)
aa.module_method

####extend方法所扩展的对象取决于调用extend方法的对象



###############################################################
#代码18

class String

	def truncate(n)
		self[0,n]+(self.size>n ? '...':'')
	end

	for i in[5,8,10,20]
		module_eval "def truncate_#{i}
			truncate #{i}
		end
		"
	end
end

puts "abcdefg".truncate(2)
puts "abcdefghijkln".truncate_5
puts "abcdefghijkln".truncate_8



puts "abcd".upcase
puts my_method="upcase"
puts "efg".send(my_method)
puts my_method="downcase"
puts "ABCD".send(my_method)


###############################################################
#代码19


puts String.methods,"//methods end" 					#获取所有方法
puts String.instance_methods,"//instance methods end" 	#获取所有公开的实例方法
puts String.method_defined?(:reverse)  	#检测类是否定义了某实例方法
puts "str".respond_to?(:upcase)  		#检测类是否可以响应某实例方法的调用


str="PI"
puts Math.const_get(str) 	#const_get可以根据常量名称获取模块或者类中的常量值 =>3.14159265358979


class_name="Array"
array_class=Object.const_get(class_name) 	#所有的类都是继承自Object,每个类在Object中都有个class常量
puts array_class.new


@aa=1
puts self.instance_variable_get("@aa")
self.instance_variable_set("@aa",2)
puts @aa




###############################################################
#代码20

class MyClass

	def self.new_method(name,&block)
		define_method(name,&block) 		#动态定义方法
	end
end

MyClass.new_method(:my_new_method){ puts "这是动态定义的新方法"}
my_class=MyClass.new
my_class.my_new_method



class Module

	def const_missing(name)
		puts "常数{name} 没有定义"
	end

	def method_missing(name,*args)
		puts "方法#{name}没有定义！"
	end
end

puts String.unknown_method 	#输出方法unknown_method没有定义！
puts String::Unknown_Const 	#常数{name} 没有定义


class Module

	def const_missing(name)

		#使用正则表达式对没有定义的常数名进行匹配
		match=/^ASCII_FOR_([A-Z]|[a-z])$/.match(name.to_s)
		
		if match
			#如果符合ASCII_FOR_*字母的表达形式则返回相应的ASCII码
			return match[1][0]
		else
			#否则依然报错
			raise NoMethodError
		end
	end
end


puts ASCII_FOR_A  		#输出A的ASCII码65
puts ASCII_FOR_z		#输出Z的ASCII码122
#puts ASCII_FOR_ab		#NoMethodError (NoMethodError)



###############################################################
#代码21

class Student
	attr_accessor:name,:sex,:age,:grade

	def initialize(_name,_sex,_age,_grade)
		self.name=_name
		self.sex=_sex
		self.age=_age
		self.grade=_grade
	end

	#定义to_s方法后，使用puts会直接输出学生的姓名
	def to_s
		self.name
	end
end

class School<Array
	#查找学生
	def find_student(by,value)
		#使用Array类的find_all方法，并使用send方法动态获得属性
		#puts self
		self.find_all{|st| st.send(by)==value}
	end

	def add_student(student)
		self<<student
	end

	def method_missing(name,argument)
		#使用正则表达式对没有定义的方法名进行匹配
		match=/^find_student_by_([a-z]+)$/.match(name.to_s)
		if match
			#如果符合find_by_name等形式则调用find_student进行查找
			find_student match[1],argument
		else
			raise NoMethodError
		end
	end
end

school=School.new
school.add_student(Student.new("张三","非女",16,"初1"))
school.add_student(Student.new("李四","女",12,"初2"))
school.add_student(Student.new("王五","男",11,"初3"))
school.add_student(Student.new("赵四","非男",19,"初1"))


puts "名字叫张三的学生有:"
puts school.find_student_by_name("张三")
puts "性别是男的学生有:"
puts school.find_student_by_sex("男")
puts "年龄是16的学生有"
puts school.find_student_by_age("16")



###############################################################
#代码22

def test_function
	puts "test_function"
end


undef test_function		#删除方法定义


class MyClass

	def method1
		puts "super_method1"
	end

	def method2
		puts "method2"
	end

	def method3
		puts "sup_method3"
	end
end


class MySubClass < MyClass

	def method1
		puts "method1"
	end

	def method2
		puts "method2"
	end

	remove_method:method1  	#删除当前类的方法
	#remove_method:method3 	#不能删除父类的方法
	undef_method:method2 	#能将当前类，父类的此方法都删除
end


sub_class=MySubClass.new
sub_class.method1 		#输出method1
#sub_class.method2 		#出错



###############################################################
#代码23

def run_twice

	puts "开始运行"
	yield 1
	yield 1
	yield 0
	puts "运行结束"
end


#调用方法绑定{}代码块
run_twice {|i| if i then puts "#{i} Say Hello!" else puts "not i" end}


#|i| 在代码块中|x,y,z|是参数

j=0
#调用方法绑定do..end代码块
run_twice do |j|
	puts j
	j=j+1
	puts j
end

puts 1+1



###############################################################
#代码24

class Array

	def for_each
		#遍历数组
		for i in (0..self.length-1)
			#将数组中元素逐个传入代码块进行迭代
			yield self[i]
		end
	end
end


#数组迭代
(["a","b","c"]).for_each{|i| puts i}

#数组迭代
sum=0
[1,2,3,4,10].for_each do |i|
	sum=sum+i
end
puts sum




###############################################################
#代码25

my_block=Proc.new{|x| puts "block method #{x}"}

def run_twice(arg,&block)

	puts "开始运行"
	block.call arg
	puts "运行结束"
end
run_twice("hello",&my_block)


#直接传匿名代码块也行
run_twice("hello") {|word| puts "nick method #{word}"}



#Proc 与 lambda 代码块方式

def proc_test
	f=Proc.new{return "从Proc代码块中直接跳出"}
	f.call
	return "proc_test正常退出"
end


def lambda_test
	f=lambda{return "从lambda中直接跳出"}
	f.call
	return "lambda_test正常退出"
end


puts proc_test 			#输出从Proc代码块中直接跳出
puts lambda_test 		#输出lambda_test正常退出

##Proc的代码块return后直接跳出，lambda的代码块return后，会继续执行下面的代码

###############################################################
#代码26


begin
	y=10
	z=0
	x=y/z
	puts x
rescue ZeroDivisionError
	puts "除数为0！"
	raise ZeroDivisionError,"除数为000!"
rescue => err
	puts err
ensure
	#try end
	puts "end ....."
end






