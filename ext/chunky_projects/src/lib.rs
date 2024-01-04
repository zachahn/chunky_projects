use magnus::{class, function, prelude::*, Error, Ruby};
use rustextile::{HtmlKind, Textile};

fn to_html(textile: String) -> String {
    let parser = Textile::default().set_html_kind(HtmlKind::HTML5);
    let html = parser.parse(textile.as_str());

    return html;
}

#[magnus::init]
fn init(ruby: &Ruby) -> Result<(), Error> {
    let namespace = ruby.define_module("ChunkyProjects")?;
    let internal = namespace.define_class("Internal", class::object())?;
    internal.define_singleton_method("to_html", function!(to_html, 1))?;
    Ok(())
}
