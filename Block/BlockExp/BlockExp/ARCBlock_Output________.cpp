#ifndef __OBJC2__
#define __OBJC2__
#endif
struct objc_selector; struct objc_class;
struct __rw_objc_super { 
	struct objc_object *object; 
	struct objc_object *superClass; 
	__rw_objc_super(struct objc_object *o, struct objc_object *s) : object(o), superClass(s) {} 
};
#ifndef _REWRITER_typedef_Protocol
typedef struct objc_object Protocol;
#define _REWRITER_typedef_Protocol
#endif
#define __OBJC_RW_DLLIMPORT extern
__OBJC_RW_DLLIMPORT void objc_msgSend(void);
__OBJC_RW_DLLIMPORT void objc_msgSendSuper(void);
__OBJC_RW_DLLIMPORT void objc_msgSend_stret(void);
__OBJC_RW_DLLIMPORT void objc_msgSendSuper_stret(void);
__OBJC_RW_DLLIMPORT void objc_msgSend_fpret(void);
__OBJC_RW_DLLIMPORT struct objc_class *objc_getClass(const char *);
__OBJC_RW_DLLIMPORT struct objc_class *class_getSuperclass(struct objc_class *);
__OBJC_RW_DLLIMPORT struct objc_class *objc_getMetaClass(const char *);
__OBJC_RW_DLLIMPORT void objc_exception_throw( struct objc_object *);
__OBJC_RW_DLLIMPORT int objc_sync_enter( struct objc_object *);
__OBJC_RW_DLLIMPORT int objc_sync_exit( struct objc_object *);
__OBJC_RW_DLLIMPORT Protocol *objc_getProtocol(const char *);
#ifdef _WIN64
typedef unsigned long long  _WIN_NSUInteger;
#else
typedef unsigned int _WIN_NSUInteger;
#endif
#ifndef __FASTENUMERATIONSTATE
struct __objcFastEnumerationState {
	unsigned long state;
	void **itemsPtr;
	unsigned long *mutationsPtr;
	unsigned long extra[5];
};
__OBJC_RW_DLLIMPORT void objc_enumerationMutation(struct objc_object *);
#define __FASTENUMERATIONSTATE
#endif
#ifndef __NSCONSTANTSTRINGIMPL
struct __NSConstantStringImpl {
  int *isa;
  int flags;
  char *str;
  long length;
};
#ifdef CF_EXPORT_CONSTANT_STRING
extern "C" __declspec(dllexport) int __CFConstantStringClassReference[];
#else
__OBJC_RW_DLLIMPORT int __CFConstantStringClassReference[];
#endif
#define __NSCONSTANTSTRINGIMPL
#endif
#ifndef BLOCK_IMPL
#define BLOCK_IMPL
struct __block_impl {
  void *isa;
  int Flags;
  int Reserved;
  void *FuncPtr;
};
// Runtime copy/destroy helper functions (from Block_private.h)
#ifdef __OBJC_EXPORT_BLOCKS
extern "C" __declspec(dllexport) void _Block_object_assign(void *, const void *, const int);
extern "C" __declspec(dllexport) void _Block_object_dispose(const void *, const int);
extern "C" __declspec(dllexport) void *_NSConcreteGlobalBlock[32];
extern "C" __declspec(dllexport) void *_NSConcreteStackBlock[32];
#else
__OBJC_RW_DLLIMPORT void _Block_object_assign(void *, const void *, const int);
__OBJC_RW_DLLIMPORT void _Block_object_dispose(const void *, const int);
__OBJC_RW_DLLIMPORT void *_NSConcreteGlobalBlock[32];
__OBJC_RW_DLLIMPORT void *_NSConcreteStackBlock[32];
#endif
#endif
#define __block
#define __weak

#include <stdarg.h>
struct __NSContainer_literal {
  void * *arr;
  __NSContainer_literal (unsigned int count, ...) {
	va_list marker;
	va_start(marker, count);
	arr = new void *[count];
	for (unsigned i = 0; i < count; i++)
	  arr[i] = va_arg(marker, void *);
	va_end( marker );
  };
  ~__NSContainer_literal() {
	delete[] arr;
  }
};
extern "C" __declspec(dllimport) void * objc_autoreleasePoolPush(void);
extern "C" __declspec(dllimport) void objc_autoreleasePoolPop(void *);

struct __AtAutoreleasePool {
  __AtAutoreleasePool() {atautoreleasepoolobj = objc_autoreleasePoolPush();}
  ~__AtAutoreleasePool() {objc_autoreleasePoolPop(atautoreleasepoolobj);}
  void * atautoreleasepoolobj;
};

#define __OFFSETOFIVAR__(TYPE, MEMBER) ((long long) &((TYPE *)0)->MEMBER)

struct __block1_block_impl_0 {
  struct __block_impl impl;
  struct __block1_block_desc_0* Desc;
  int a;
  __block1_block_impl_0(void *fp, struct __block1_block_desc_0 *desc, int _a, int flags=0) : a(_a) {
    impl.isa = &_NSConcreteStackBlock;
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};
static void __block1_block_func_0(struct __block1_block_impl_0 *__cself) {
  int a = __cself->a; // bound by copy

        int x = a;
        x++;
    }

static struct __block1_block_desc_0 {
  size_t reserved;
  size_t Block_size;
} __block1_block_desc_0_DATA = { 0, sizeof(struct __block1_block_impl_0)};
void block1()
{
    int a = 1;
    (void (*)())&__block1_block_impl_0((void *)__block1_block_func_0, &__block1_block_desc_0_DATA, a)();
}

struct __Block_byref_a_0 {
  void *__isa;
__Block_byref_a_0 *__forwarding;
 int __flags;
 int __size;
 int a;
};

struct __block2_block_impl_0 {
  struct __block_impl impl;
  struct __block2_block_desc_0* Desc;
  __Block_byref_a_0 *a; // by ref
  __block2_block_impl_0(void *fp, struct __block2_block_desc_0 *desc, __Block_byref_a_0 *_a, int flags=0) : a(_a->__forwarding) {
    impl.isa = &_NSConcreteStackBlock;
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};
static void __block2_block_func_0(struct __block2_block_impl_0 *__cself) {
  __Block_byref_a_0 *a = __cself->a; // bound by ref

        (a->__forwarding->a) = 10;
    }
static void __block2_block_copy_0(struct __block2_block_impl_0*dst, struct __block2_block_impl_0*src) {_Block_object_assign((void*)&dst->a, (void*)src->a, 8/*BLOCK_FIELD_IS_BYREF*/);}

static void __block2_block_dispose_0(struct __block2_block_impl_0*src) {_Block_object_dispose((void*)src->a, 8/*BLOCK_FIELD_IS_BYREF*/);}

static struct __block2_block_desc_0 {
  size_t reserved;
  size_t Block_size;
  void (*copy)(struct __block2_block_impl_0*, struct __block2_block_impl_0*);
  void (*dispose)(struct __block2_block_impl_0*);
} __block2_block_desc_0_DATA = { 0, sizeof(struct __block2_block_impl_0), __block2_block_copy_0, __block2_block_dispose_0};
void block2()
{
    __attribute__((__blocks__(byref))) __Block_byref_a_0 a = {(void*)0,(__Block_byref_a_0 *)&a, 0, sizeof(__Block_byref_a_0), 1};
    (void (*)())&__block2_block_impl_0((void *)__block2_block_func_0, &__block2_block_desc_0_DATA, (__Block_byref_a_0 *)&a, 570425344)();
}

struct __Block_byref_a_1 {
  void *__isa;
__Block_byref_a_1 *__forwarding;
 int __flags;
 int __size;
 int a;
};

struct __block3_block_impl_0 {
  struct __block_impl impl;
  struct __block3_block_desc_0* Desc;
  __Block_byref_a_1 *a; // by ref
  __block3_block_impl_0(void *fp, struct __block3_block_desc_0 *desc, __Block_byref_a_1 *_a, int flags=0) : a(_a->__forwarding) {
    impl.isa = &_NSConcreteStackBlock;
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};
static void __block3_block_func_0(struct __block3_block_impl_0 *__cself) {
  __Block_byref_a_1 *a = __cself->a; // bound by ref

        (a->__forwarding->a) = 10;
    }
static void __block3_block_copy_0(struct __block3_block_impl_0*dst, struct __block3_block_impl_0*src) {_Block_object_assign((void*)&dst->a, (void*)src->a, 8/*BLOCK_FIELD_IS_BYREF*/);}

static void __block3_block_dispose_0(struct __block3_block_impl_0*src) {_Block_object_dispose((void*)src->a, 8/*BLOCK_FIELD_IS_BYREF*/);}

static struct __block3_block_desc_0 {
  size_t reserved;
  size_t Block_size;
  void (*copy)(struct __block3_block_impl_0*, struct __block3_block_impl_0*);
  void (*dispose)(struct __block3_block_impl_0*);
} __block3_block_desc_0_DATA = { 0, sizeof(struct __block3_block_impl_0), __block3_block_copy_0, __block3_block_dispose_0};
void block3()
{
    __attribute__((__blocks__(byref))) __Block_byref_a_1 a = {(void*)0,(__Block_byref_a_1 *)&a, 0, sizeof(__Block_byref_a_1), 1};
    void (*block1)(void) = (void (*)())&__block3_block_impl_0((void *)__block3_block_func_0, &__block3_block_desc_0_DATA, (__Block_byref_a_1 *)&a, 570425344);
    ((void (*)(__block_impl *))((__block_impl *)block1)->FuncPtr)((__block_impl *)block1);
}
static struct IMAGE_INFO { unsigned version; unsigned flag; } _OBJC_IMAGE_INFO = { 0, 2 };
