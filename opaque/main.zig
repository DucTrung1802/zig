// This code shows concept
// Cannot run !

const Window = opaque {
    fn show(self: *Window) void {
        show_window(self);
    }
};
const Button = opaque {
    fn show(self: *Button) void {
        // do something
        _ = self;
    }
};

extern fn show_window(*Window) callconv(.C) void;

test "opaque" {
    const main_window: *Window = undefined;
    main_window.show();

    const ok_button: *Button = undefined;
    ok_button.show();
}
