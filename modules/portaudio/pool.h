#pragma once

template <class T> class Pool{
	T* _pool[1024];
	int _count;
	int _empty[1024];
	int _slot;
public:	
	Pool():_count(1),_slot(0){}
	int create(){
		_pool[_count]=new T();		
		return _count++;
	}
	int add(T* item){
		if(item){
			_pool[_count]=item;
			return _count++;
		}
		return 0;
	}
	void remove(T* item){
		for(int i=0;i<_count;i++){
			if(_pool[i]==item){
				_pool[i]=0;
				_empty[_slot++]=i;
			}
		}		
	}
	T* get(int id){
		return _pool[id];
	}
	int count(){
		return _count-1;
	}
	int handle(int index){
		return index+1;
	}
};
