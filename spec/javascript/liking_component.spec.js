import { mount } from "@vue/test-utils";
import Liking from "components/liking";

describe("Liking", () => {
    beforeEach(() => {
        localStorage.clear();
        jest.clearAllMocks();
        localStorage.setItem.mockClear();
    });

    it("renders the likes and dislikes as zero at initial start", () => {
        const wrapper = mount(Liking, {
            data() {
                return {
                    likes: 0,
                    dislikes: 0,
                };
            },
        });

        // see if the initial likes at the start are zero
        expect(wrapper.find("button").text()).toEqual("0 likes");
    });
    it("increments count of likes or dislikes on click", async () => {
        const wrapper = mount(Liking, {
            data() {
                return {
                    likes: 0,
                    dislikes: 0,
                };
            },
        });
        const button = wrapper.find("button");

        // see if the initial likes at the start are zero
        expect(button.text()).toEqual("0 likes");

        await button.trigger("click");

        expect(button.text()).toEqual("1 likes");
    });
    it("increments localstorage count  of likes or dislikes on click", async () => {
        const wrapper = mount(Liking, {
            data() {
                return {
                    likes: 0,
                    dislikes: 0,
                };
            },
        });
        const button = wrapper.find("button");
        localStorage.likes = 0;

        // see if the initial localstorage value of likes at the start is zero
        expect(localStorage.likes).toEqual(0);

        await button.trigger("click");

        expect(localStorage.likes).toEqual(1);
    });
});
