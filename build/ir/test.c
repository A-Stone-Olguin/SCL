#include <lean/lean.h>
#include <stdio.h>


extern lean_object *_lean_main(lean_object *);
extern lean_object *initialize_Main(uint8_t builtin, lean_object *w);
void lean_initialize_runtime_module();

int main(void)
{
    lean_object *in;
    lean_object *res;
    lean_initialize_runtime_module();
    lean_set_panic_messages(false);
    res = initialize_Main(1 /* builtin */, lean_io_mk_world());
    lean_set_panic_messages(true);
    lean_io_mark_end_initialization();
    if (lean_io_result_is_ok(res))
    {
        lean_dec_ref(res);
        lean_init_task_manager();
        res = _lean_main(lean_io_mk_world());
    }

    // printf("Hello after the message\n");
    // printf("Hello again!\n");
    lean_finalize_task_manager();
    if (lean_io_result_is_ok(res))
    {
        int ret = 0;
        lean_dec_ref(res);
        return ret;
    }
    else
    {
        lean_io_result_show_error(res);
        lean_dec_ref(res);
        return 1;
    }
}