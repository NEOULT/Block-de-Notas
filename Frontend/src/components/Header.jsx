import HeaderActionButton from "./HeaderActionButton";
import HeaderTittle from "./HeaderTittle"
import styled from "styled-components";

const HeaderWrapper = styled.div`
    display: flex;
    justify-content: space-between;
    align-items: left;
`;

const Header = (props) => {
    return(
        <HeaderWrapper>
            <HeaderTittle />
            <HeaderActionButton onClick={props.onClick}/>
        </HeaderWrapper>
        
    )
}

export default Header;