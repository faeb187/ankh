import { gallery } from "uis";
import type { AnkhUiGalleryOptions } from "types/ui.type";

describe("UI Gallery", () => {
  const options: AnkhUiGalleryOptions = {
    id: "galleryTest",
    items: [0, 1, 2, 3, 4, 5, 6, 7, 8].map(() => ({
      alt: "Kitten",
      src: "https://placekitten.com/180/105",
      text: "txt-kitten",
      title: "kitten",
    })),
    parentId: "compounds-gallery",
    ui: "gallery",
  };

  it("[init] returns correct HTMLElement", () => {
    const $ui = gallery.init(options);
    const isHTMLElement = (element: HTMLElement) =>
      element instanceof HTMLElement;

    expect(() => isHTMLElement($ui)).not.toThrow();
    expect(isHTMLElement($ui)).toBe(true);
    expect($ui.id).toBe("galleryTest");
  });
});
